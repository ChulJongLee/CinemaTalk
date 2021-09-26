package com.kosta.service;

import java.io.IOException;
import java.net.MalformedURLException;

import com.kosta.dto.KmdbResponseDTO;

public interface KmdbAPI {
	public KmdbResponseDTO requestMovieDetail(String movieCd, String movieNm, String showTm, String director) throws MalformedURLException, IOException;
}
