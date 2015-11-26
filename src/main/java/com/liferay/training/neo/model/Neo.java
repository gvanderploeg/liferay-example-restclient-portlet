package com.liferay.training.neo.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Neo {

	public static class CloseApproachData {
	
		@JsonProperty("close_approach_date")
		private Date closeApproachDate;
		
		@JsonProperty("orbiting_body")
		private String orbitingBody;

		@JsonProperty("miss_distance")
		private Map<String, BigDecimal> missDistance;

		public BigDecimal getMissDistance() {
			return missDistance.get("kilometers");
		}
		@JsonProperty("relative_velocity")
		private Map<String, BigDecimal> relativeVelocity;

		public BigDecimal getRelativeVelocity() {
			return relativeVelocity.get("kilometers_per_hour");
		}
		
		public String getOrbitingBody() {
			return orbitingBody;
		}
		
		public Date getCloseApproachDate() {
			return closeApproachDate;
		}
	}

	@JsonProperty("neo_reference_id")
	private long id;

	private String name;
	
	@JsonProperty("nasa_jpl_url")
	private String nasaJplUrl;
	

	@JsonProperty("is_potentially_hazardous_asteroid")
	private boolean potentiallyHazardousAsteroid;

	@JsonProperty("close_approach_data")
	private List<CloseApproachData> closeApproachData;
	
	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}


	public boolean isPotentiallyHazardousAsteroid() {
		return potentiallyHazardousAsteroid;
	}

	public String getNasaJplUrl() {
		return nasaJplUrl;
	}


	public CloseApproachData getCloseApproachData() {
		return closeApproachData.get(0);
	}

}
