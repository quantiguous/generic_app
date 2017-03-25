Branch.seed_once(:id,
  {name: 'Chandni Chowk', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Chawri Bazar', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Darya Ganj', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Delhi - DB Gupta Road', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Delhi - Hudson Lines', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Delhi - New Rohtak Road', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Delhi - Shastri Nagar', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Kamala Nagar', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Karol Bagh', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'New Delhi - Jhandewala', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'New Delhi - Kashmere Gate', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Sadar Bazaar', cluster_id: Cluster.find_by_name('Central Delhi').id},
  {name: 'Delhi - Priyadarshini Vihar', cluster_id: Cluster.find_by_name('East Delhi').id},
  {name: 'Krishna Nagar', cluster_id: Cluster.find_by_name('East Delhi').id},
  {name: 'Mayur Vihar', cluster_id: Cluster.find_by_name('East Delhi').id},
  {name: 'Preet Vihar', cluster_id: Cluster.find_by_name('East Delhi').id},
  {name: 'Shakarpur', cluster_id: Cluster.find_by_name('East Delhi').id},
  {name: 'Chanakyapuri (Malcha Market)', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Connaught Place', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Connaught Place 2', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Delhi - Gole Market', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Delhi - Mayapuri', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Delhi - Rajouri Garden 2', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Naraina Industrial Estate', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Rajouri Garden', cluster_id: Cluster.find_by_name('New Delhi').id},
  {name: 'Delhi - Tagore Park', cluster_id: Cluster.find_by_name('North Delhi').id},
  {name: 'Model Town', cluster_id: Cluster.find_by_name('North Delhi').id},
  {name: 'Delhi - Adarsh Nagar', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'Delhi - Pitampura 2', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'New Delhi - Ashok Vihar', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'New Delhi - Rohini 2', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'New Delhi - Rohini 3', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'Pitampura', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'Rajdhani Enclave', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'Rohini', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'Shalimar Bagh', cluster_id: Cluster.find_by_name('North West Delhi').id},
  {name: 'Delhi - Karkardooma', cluster_id: Cluster.find_by_name('Shahdara').id},
  {name: 'Delhi - Vivek Vihar', cluster_id: Cluster.find_by_name('Shahdara').id},
  {name: 'Ram Vihar', cluster_id: Cluster.find_by_name('Shahdara').id},
  {name: 'Chhatarpur', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'Green Park', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'Malviya Nagar', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'New Delhi - Bhikaji Cama Place', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'New Delhi - Vasant Kunj', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'Saket', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'South Extension', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'Vasant Vihar', cluster_id: Cluster.find_by_name('South Delhi').id},
  {name: 'Delhi - East of Kailash', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Delhi - Kalkaji', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Delhi - Lajpat Nagar IV', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Delhi - Mohan Cooperative Area', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Delhi - Sunder Nagar', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Jangpura', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Jasola', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Lajpat Nagar', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Nehru Place', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'New Delhi - GK 1', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'New Delhi - GK 2', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'New Friends Colony', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Okhla', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Okhla Phase 3', cluster_id: Cluster.find_by_name('South East Delhi').id},
  {name: 'Delhi - Dwarka More', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Delhi - Janakpuri C Block', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Delhi - Janakpuri D Block', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Delhi - Sarojini Nagar', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Delhi - Sector 23 Dwarka', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Delhi - Sector 7 Dwarka', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Dwarka', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Janakpuri', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Kapashera', cluster_id: Cluster.find_by_name('South West Delhi').id},
  {name: 'Delhi - Guru Harkishan Nagar', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Delhi - Moti Nagar', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Delhi - Old Rajinder Nagar', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Delhi - Paschim Vihar', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Delhi - Patel Nagar (East)', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Delhi - Peeragarhi', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Delhi - Tilak Nagar', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Kirti Nagar', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Meera Bagh', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'New Delhi - Vikas Puri', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Punjabi Bagh', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Rajinder Place', cluster_id: Cluster.find_by_name('West Delhi').id},
  {name: 'Calangute', cluster_id: Cluster.find_by_name('North Goa').id},
  {name: 'Mapusa', cluster_id: Cluster.find_by_name('North Goa').id},
  {name: 'Panjim', cluster_id: Cluster.find_by_name('North Goa').id},
  {name: 'Ponda', cluster_id: Cluster.find_by_name('North Goa').id},
  {name: 'Curchorem', cluster_id: Cluster.find_by_name('South Goa').id},
  {name: 'Madgaon', cluster_id: Cluster.find_by_name('South Goa').id},
  {name: 'Mormugao - Vasco', cluster_id: Cluster.find_by_name('South Goa').id},
  {name: 'Varca', cluster_id: Cluster.find_by_name('South Goa').id},
  {name: 'Cadell Road', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Colaba', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Fort', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Greater Mumbai - Charni Road', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Greater Mumbai - Jacob Circle', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Greater Mumbai - Warden Road', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Indiabulls Finance Center', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Lamington Road', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Marine Drive', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Metro', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Napeansea Road', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Nariman Point', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Parel', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Prabhadevi', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Sion', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Worli', cluster_id: Cluster.find_by_name('Mumbai').id},
  {name: 'Andheri (E)', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Andheri (W)', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Bandra', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Bandra East', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Borivali', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Borivali - Yogi Nagar', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Chembur', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Ghatkopar', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Goregaon', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Greater Mumbai - Chembur East', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Greater Mumbai - Kanjur Marg', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Greater Mumbai - Mulund West', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Greater Mumbai - Pheonix Market City', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Jogeshwari', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Juhu', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Kandivili', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Kandivili (w)', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Malad', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Mulund', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Mumbai - 4 Bungalows', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Mumbai - Pali Hill', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Mumbai - Saki Naka', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Mumbai - SEEPZ', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Powai', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'S V Road, Kandivili (W)', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Santacruz', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Shoppers Stop - Andheri (W)', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'SV Road - Khar', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Veera Desai Road', cluster_id: Cluster.find_by_name('Mumbai Suburban').id},
  {name: 'Vile Parle East', cluster_id: Cluster.find_by_name('Mumbai Suburban').id}
)