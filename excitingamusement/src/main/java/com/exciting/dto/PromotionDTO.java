package com.exciting.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PromotionDTO {
	private int promotion_id;
	private int amuse_id;
	private String promotion_content;
	private String promotion_name;
	private String promotion_img;
	private double discount;
}
