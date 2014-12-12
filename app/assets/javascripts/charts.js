  function load_chart()
  {
    $('.header').css('position', 'relative');
  $.plot($("#delay_analysis"), delay_analysis, {
    series: {
      pie: {
        show: true
      }
    }
  });
  $.plot($("#location_analysis"), location_analysis_data, {
    grid:{
      hoverable: true
    },
    xaxis: {
      mode: "time",
      timeformat: "%b",
      tickSize: [1, "month"],
      monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      tickLength: 0, // hide gridlines
      axisLabel: 'Month',
      axisLabelUseCanvas: true,
      axisLabelFontSizePixels: 12,
      axisLabelFontFamily: 'Verdana, Arial, Helvetica, Tahoma, sans-serif',
      axisLabelPadding: 5
    },
    yaxis: {
      axisLabel: 'Location Count'
    },
    series: {
        points: {
            radius: 3,
            show: true,
            fill: true
        },
    }
  });
  $.plot($("#closure_analysis"), closure_analysis_data, {
    grid:{
      hoverable:true
    },
    xaxis:{
      axisLabel: "TAT in Days"
    },
    yaxis:{
      axisLabel: "Closure Tickets Count"
    }
  });
  $.plot($("#ticket_tat"), data_tat, {
    series: {
      pie: {
        show: true,
        combine: {
          color: "#999",
          threshold: 0.05
        }
      }
    },
    legend: {
      show: false
    },
    grid: {
      hoverable: true,
      clickable: true
    }
  });
  $("#ticket_tat").bind("plotclick", function(event, pos, obj) {
    if (!obj) {
      return;
    }

    percent = parseFloat(obj.series.percent).toFixed(2);
    location.href = "/tickets/get_tat_tickets?tat="+obj.series.label;
  });
  $.plot($("#ticket_class"), data_ticket_class, {
      series: {
      pie: {
      show: true
      }
      }
  });

    var previousPoint;
    //tooltip function
    function showTooltip(x, y, contents, areAbsoluteXY) {
      var rootElt = 'body';

      $('<div id="tooltip" class="tooltip-with-bg">' + contents + '</div>').css( {
          position: 'absolute',
          display: 'none',
          'z-index':'1010',
          top: y,
          left: x
      }).prependTo(rootElt).show();
    }

//add tooltip event
    $("#closure_analysis").bind("plothover", function (event, pos, item) {
        if (item) {
            if (previousPoint != item.datapoint) {
                previousPoint = item.datapoint;

                //delete de prÃ©cÃ©dente tooltip
                $('.tooltip-with-bg').remove();

                var x = "Tat : 4 Days" + item.datapoint[0] + "";

                //All the bars concerning a same x value must display a tooltip with this value and not the shifted value
                if(item.series.bars.order){
                    for(var i=0; i < item.series.data.length; i++){
                        if(item.series.data[i][3] == item.datapoint[0])
                            x = item.series.data[i][0];
                    }
                }

                var y = item.datapoint[1] + " Tickets " + item.series.label;

                showTooltip(item.pageX+5, item.pageY+5, "Tat " + x + " Days "+  ":" + y);

            }
        }
        else {
            $('.tooltip-with-bg').remove();
            previousPoint = null;
        }

    });
    $("#location_analysis").bind("plothover", function (event, pos, item) {
        if (item) {
            if (previousPoint != item.datapoint) {
                previousPoint = item.datapoint;
                $('.tooltip-with-bg').remove();

                var x = "Tat : 4 Days" + item.datapoint[0] + "";

                //All the bars concerning a same x value must display a tooltip with this value and not the shifted value
                if(item.series.bars.order){
                    for(var i=0; i < item.series.data.length; i++){
                        if(item.series.data[i][3] == item.datapoint[0])
                            x = item.series.data[i][0];
                    }
                }
                var y = item.datapoint[1];

                showTooltip(item.pageX+10, item.pageY+15, y + " "+ item.series.label);

            }
        }
        else {
            $('.tooltip-with-bg').remove();
            previousPoint = null;
        }

    });
  }