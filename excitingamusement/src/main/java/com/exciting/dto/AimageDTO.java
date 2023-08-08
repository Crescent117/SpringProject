package com.exciting.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AimageDTO {
	private int aimg_id;
	private String aimg_name;
	private int amuse_id;
	private String url;
}
