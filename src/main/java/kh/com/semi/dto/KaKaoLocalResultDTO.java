package kh.com.semi.dto;

public class KaKaoLocalResultDTO {
		private double lat;
		private double lng;
		
		public KaKaoLocalResultDTO(){}
		public KaKaoLocalResultDTO(double lat, double lng) {
			this.lat = lat;
			this.lng = lng;
		}
		public double getLat() {
			return lat;
		}

		public double getLng() {
			return lng;
		}
		@Override
		public String toString() {
			return "KaKaoLocalResult{" + "lat=" + lat + ", lng=" + lng + '}';
		}
}
