/*
 * Flot plugin to order bars side by side.
 *
 * Released under the MIT license by Benjamin BUFFET, 20-Sep-2010.
 *
 * This plugin is an alpha version.
 *
 * To activate the plugin you must specify the parameter "order" for the specific serie :
 *
 *  $.plot($("#placeholder"), [{ data: [ ... ], bars :{ order = null or integer }])
 *
 * If 2 series have the same order param, they are ordered by the position in the array;
 *
 * The plugin adjust the point by adding a value depanding of the barwidth
 * Exemple for 3 series (barwidth : 0.1) :
 *
 *          first bar dÃ©calage : -0.15
 *          second bar dÃ©calage : -0.05
 *          third bar dÃ©calage : 0.05
 *
 */

(function($){
    function init(plot){
        var orderedBarSeries;
        var nbOfBarsToOrder;
        var borderWidth;
        var borderWidthInXabsWidth;
        var pixelInXWidthEquivalent = 1;
        var isHorizontal = false;

        /*
         * This method add shift to x values
         */
        function reOrderBars(plot, serie, datapoints){
            var shiftedPoints = null;

            if(serieNeedToBeReordered(serie)){
                checkIfGraphIsHorizontal(serie);
                calculPixel2XWidthConvert(plot);
                retrieveBarSeries(plot);
                calculBorderAndBarWidth(serie);

                if(nbOfBarsToOrder >= 2){
                    var position = findPosition(serie);
                    var decallage = 0;

                    var centerBarShift = calculCenterBarShift();

                    if (isBarAtLeftOfCenter(position)){
                        decallage = -1*(sumWidth(orderedBarSeries,position-1,Math.floor(nbOfBarsToOrder / 2)-1)) - centerBarShift;
                    }else{
                        decallage = sumWidth(orderedBarSeries,Math.ceil(nbOfBarsToOrder / 2),position-2) + centerBarShift + borderWidthInXabsWidth*2;
                    }

                    shiftedPoints = shiftPoints(datapoints,serie,decallage);
                    datapoints.points = shiftedPoints;
               }
           }
           return shiftedPoints;
        }

        function serieNeedToBeReordered(serie){
            return serie.bars != null
                && serie.bars.show
                && serie.bars.order != null;
        }

        function calculPixel2XWidthConvert(plot){
            var gridDimSize = isHorizontal ? plot.getPlaceholder().innerHeight() : plot.getPlaceholder().innerWidth();
            var minMaxValues = isHorizontal ? getAxeMinMaxValues(plot.getData(),1) : getAxeMinMaxValues(plot.getData(),0);
            var AxeSize = minMaxValues[1] - minMaxValues[0];
            pixelInXWidthEquivalent = AxeSize / gridDimSize;
        }

        function getAxeMinMaxValues(series,AxeIdx){
            var minMaxValues = new Array();
            for(var i = 0; i < series.length; i++){
                minMaxValues[0] = series[i].data[0][AxeIdx];
                minMaxValues[1] = series[i].data[series[i].data.length - 1][AxeIdx];
            }
            return minMaxValues;
        }

        function retrieveBarSeries(plot){
            orderedBarSeries = findOthersBarsToReOrders(plot.getData());
            nbOfBarsToOrder = orderedBarSeries.length;
        }

        function findOthersBarsToReOrders(series){
            var retSeries = new Array();

            for(var i = 0; i < series.length; i++){
                if(series[i].bars.order != null && series[i].bars.show){
                    retSeries.push(series[i]);
                }
            }

            return retSeries.sort(sortByOrder);
        }

        function sortByOrder(serie1,serie2){
            var x = serie1.bars.order;
            var y = serie2.bars.order;
            return ((x < y) ? -1 : ((x > y) ? 1 : 0));
        }

        function  calculBorderAndBarWidth(serie){
            borderWidth = serie.bars.lineWidth ? serie.bars.lineWidth  : 2;
            borderWidthInXabsWidth = borderWidth * pixelInXWidthEquivalent;
        }

        function checkIfGraphIsHorizontal(serie){
            if(serie.bars.horizontal){
                isHorizontal = true;
            }
        }

        function findPosition(serie){
            var pos = 0
            for (var i = 0; i < orderedBarSeries.length; ++i) {
                if (serie == orderedBarSeries[i]){
                    pos = i;
                    break;
                }
            }

            return pos+1;
        }

        function calculCenterBarShift(){
            var width = 0;

            if(nbOfBarsToOrder%2 != 0)
                width = (orderedBarSeries[Math.ceil(nbOfBarsToOrder / 2)].bars.barWidth)/2;

            return width;
        }

        function isBarAtLeftOfCenter(position){
            return position <= Math.ceil(nbOfBarsToOrder / 2);
        }

        function sumWidth(series,start,end){
            var totalWidth = 0;

            for(var i = start; i <= end; i++){
                totalWidth += series[i].bars.barWidth+borderWidthInXabsWidth*2;
            }

            return totalWidth;
        }

        function shiftPoints(datapoints,serie,dx){
            var ps = datapoints.pointsize;
            var points = datapoints.points;
            var j = 0;
            for(var i = isHorizontal ? 1 : 0;i < points.length; i += ps){
                points[i] += dx;
                //Adding the new x value in the serie to be abble to display the right tooltip value,
                //using the index 3 to not overide the third index.
                serie.data[j][3] = points[i];
                j++;
            }

            return points;
        }

        plot.hooks.processDatapoints.push(reOrderBars);

    }

    var options = {
        series : {
            bars: {order: null} // or number/string
        }
    };

    $.plot.plugins.push({
        init: init,
        options: options,
        name: "orderBars",
        version: "0.2"
    });

})(jQuery);

(function($) {
  var options = {};

  function init(plot) {
    var secondPass = false;
    var defaultPadding = 2;
    plot.hooks.draw.push(function(plot, ctx) {
      if (!secondPass) {
        $.each(plot.getAxes(), function(axisName, axis) {
          var opts = axis.options || plot.getOptions()[axisName];
          if (!opts || !opts.axisLabel) return;
          var w, h;
          var padding = opts.axisLabelPadding === undefined ? defaultPadding : opts.axisLabelPadding;
          if (opts.axisLabelUseCanvas != false) opts.axisLabelUseCanvas = true;
          if (opts.axisLabelUseCanvas) {
            if (!opts.axisLabelFontSizePixels) opts.axisLabelFontSizePixels = 14;
            if (!opts.axisLabelFontFamily) opts.axisLabelFontFamily = 'sans-serif';
            w = opts.axisLabelFontSizePixels + padding;
            h = opts.axisLabelFontSizePixels + padding;
          } else {
            var elem = $('<div class="axisLabels" style="position:absolute;">' + opts.axisLabel + '</div>');
            plot.getPlaceholder().append(elem);
            w = elem.outerWidth(true);
            h = elem.outerHeight(true);
            elem.remove();
          }
          if (axisName.charAt(0) == 'x') axis.labelHeight += h;
          else
          axis.labelWidth += w;
          opts.labelHeight = axis.labelHeight;
          opts.labelWidth = axis.labelWidth;
        });
        secondPass = true;
        plot.setupGrid();
        plot.draw();
      } else {
        $.each(plot.getAxes(), function(axisName, axis) {
          var opts = axis.options || plot.getOptions()[axisName];
          if (!opts || !opts.axisLabel) return;
          if (opts.axisLabelUseCanvas) {
            var ctx = plot.getCanvas().getContext('2d');
            ctx.save();
            ctx.font = opts.axisLabelFontSizePixels + 'px ' + opts.axisLabelFontFamily;
            var width = ctx.measureText(opts.axisLabel).width;
            var height = opts.axisLabelFontSizePixels;
            var x, y, angle = 0;
            if (axisName == 'xaxis') {
              x = plot.getPlotOffset().left + plot.width() / 2 - width / 2;
              y = plot.getCanvas().height - height * 0.28;
            } else if (axisName == 'x2axis') {
              x = plot.getPlotOffset().left + plot.width() / 2 - width / 2;
              y = height;
            } else if (axisName == 'yaxis') {
              x = height * 0.72;
              y = plot.getPlotOffset().top + plot.height() / 2 + width / 2;
              angle = -Math.PI / 2;
            } else if (axisName == 'y2axis') {
              x = plot.getPlotOffset().left + plot.width() + plot.getPlotOffset().right - height * 0.72;
              y = plot.getPlotOffset().top + plot.height() / 2 - width / 2;
              angle = Math.PI / 2;
            }
            ctx.translate(x, y);
            ctx.rotate(angle);
            ctx.fillText(opts.axisLabel, 0, 0);
            ctx.restore();
          } else {
            plot.getPlaceholder().find('#' + axisName + 'Label').remove();
            var elem = $('<div id="' + axisName + 'Label" " class="axisLabels" style="position:absolute;">' + opts.axisLabel + '</div>');
            plot.getPlaceholder().append(elem);
            if (axisName == 'xaxis') {
              elem.css('left', plot.getPlotOffset().left + plot.width() / 2 - elem.outerWidth() / 2 + 'px');
              elem.css('bottom', '0px');
            } else if (axisName == 'x2axis') {
              elem.css('left', plot.getPlotOffset().left + plot.width() / 2 - elem.outerWidth() / 2 + 'px');
              elem.css('top', '0px');
            } else if (axisName == 'yaxis') {
              elem.css('top', plot.getPlotOffset().top + plot.height() / 2 - elem.outerHeight() / 2 + 'px');
              elem.css('left', '0px');
            } else if (axisName == 'y2axis') {
              elem.css('top', plot.getPlotOffset().top + plot.height() / 2 - elem.outerHeight() / 2 + 'px');
              elem.css('right', '0px');
            }
          }
        });
      }
    });
  }
  $.plot.plugins.push({
    init: init,
    options: options,
    name: 'axisLabels',
    version: '1.0'
  });
})(jQuery);