package com.liferay.training.neo.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.annotation.JsonProperty;

@XmlRootElement
public class NeoResponse {

	@JsonProperty("near_earth_objects")
	private Map<String, List<Neo>> nearEarthObjectsByDate;
	
	@JsonProperty("element_count")
	private int elementCount;

	public List<Neo> getNearEarthObjects() {
		List<Neo> result = new ArrayList<Neo>();
		for (List<Neo> subList : nearEarthObjectsByDate.values()) {
			result.addAll(subList);
		}
		return result;
	}

	public int getElementCount() {
		return elementCount;
	}

	public void setElementCount(int elementCount) {
		this.elementCount = elementCount;
	}

}
