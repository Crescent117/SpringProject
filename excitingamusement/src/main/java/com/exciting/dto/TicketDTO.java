package com.exciting.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketDTO {
	private int ticket_id;
	private int promotion_id;
	private String ticket_name;
	private int ticket_price;
}
