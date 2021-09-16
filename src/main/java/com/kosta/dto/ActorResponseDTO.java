package com.kosta.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ActorResponseDTO {
	  private int display;
	  private List<ActorDTO> items;
}
