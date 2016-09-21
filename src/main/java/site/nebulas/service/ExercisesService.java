package site.nebulas.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import site.nebulas.beans.Exercises;
import site.nebulas.dao.ExercisesDao;

@Service
public class ExercisesService {
	@Resource
	private ExercisesDao exercisesDao;

    public List<Exercises> queryByParam(Exercises exercises){
    	return exercisesDao.queryByParam(exercises);
    }
	
    public void inster(Exercises exercises){
    	exercisesDao.inster(exercises);
    }
    
    public void update(Exercises exercises){
    	exercisesDao.update(exercises);
    }
   
}


