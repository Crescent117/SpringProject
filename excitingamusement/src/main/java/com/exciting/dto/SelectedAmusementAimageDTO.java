package com.exciting.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SelectedAmusementAimageDTO {
	private int selected_id;
	private int amuse_id;
	private String a_name;
	private String a_country;
	private String a_time;
	private int aimg_id;
	private String aimg_name;
	private String url;
}
