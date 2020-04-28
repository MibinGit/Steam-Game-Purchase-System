package edu.neu.Daos;

import java.util.List;

import edu.neu.Modules.Game;
import edu.neu.Modules.Wish;
import edu.neu.Modules.Userinfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("infodao")
@Transactional
public class InfoDao
{
	private Log log = LogFactory.getLog(InfoDao.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly = true)
	public Userinfo findByname(String username)
	{
		return (Userinfo) sessionFactory.getCurrentSession().getNamedQuery("Userinfo.findByName").
				setParameter("username", username).uniqueResult();
	}
	
	public Game findById(long id)
	{
		return (Game) sessionFactory.getCurrentSession().getNamedQuery("Game.findById").
				setParameter("id", id).uniqueResult();
	}

	public Wish findwishById(long id)
	{
		return (Wish) sessionFactory.getCurrentSession().getNamedQuery("Wish.findwishById").
				setParameter("id", id).uniqueResult();
	}
	
	public void saveUser(Userinfo userinfo)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(userinfo);
		log.info("userinfo saved with id: " + userinfo.getId());
	}
	
	public void saveGame(Game game)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(game);
		log.info("game saved with id: " + game.getId());
	}

	public void saveWish(Wish wish)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(wish);
		log.info("wish saved with id: " + wish.getId());
	}

	public void deleteWish(Wish wish)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(wish);
		log.info("wish deleted with id: " + wish.getId());
	}
	
	public List<Game> findAllCourse()
	{
		return sessionFactory.getCurrentSession().createQuery("from game c").list();
	}

	public List<Wish> findAllWish()
	{
		return sessionFactory.getCurrentSession().createQuery("from wish w").list();
	}
}