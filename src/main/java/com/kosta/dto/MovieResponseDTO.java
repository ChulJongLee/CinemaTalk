package com.kosta.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter  @Setter
public class MovieResponseDTO {

    private int display;
    private List<ItemDTO> items;
    
}