package com.exciting.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
	private int order_id;
	private Timestamp order_date;
	private int order_amount;
	private boolean check;
}
