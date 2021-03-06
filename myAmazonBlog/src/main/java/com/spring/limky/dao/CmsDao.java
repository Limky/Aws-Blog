package com.spring.limky.dao;

import java.util.List;

import com.spring.limky.model.Scrap;


public interface CmsDao {
    
   Boolean insertScrapDao(Scrap v);
   Scrap getModifiedScrapDao(String num);
   Boolean updateScrapDao(Scrap v);
   Boolean deleteScrapDao(String v);
   List<Scrap> getScrapListDao(String s);

}

