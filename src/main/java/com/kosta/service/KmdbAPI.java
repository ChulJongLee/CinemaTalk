package com.kosta.service;

import java.io.IOException;
import java.net.MalformedURLException;

import com.kosta.dto.KmdbResponseDTO;
import com.kosta.dto.RequestDTO;

public interface KmdbAPI {
	public KmdbResponseDTO requestMovieDetail(RequestDTO rdto) throws IOException;
	public String requestMoviePoster(RequestDTO rdto) throws MalformedURLException, IOException;


}
