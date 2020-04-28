package edu.neu.Controllers;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import edu.neu.Daos.InfoDao;
import edu.neu.Modules.Game;
import edu.neu.Modules.Wish;
import edu.neu.Modules.Userinfo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
@RequestMapping("/User/*")
public class UserController
{
	@GetMapping("/UserInterface")
	public String home(Model model)
	{
		Userinfo userinfo = infodao.findByname(getPrincipal());
		model.addAttribute("userinfo", userinfo);
		return "User/UserInterface";
	}
	
	@GetMapping("/BuyGame")
	public String addgame(Model model)
	{
		List<Game> games = infodao.findAllCourse();
		model.addAttribute("game", games);
		return "User/BuyGame";
	}

	@GetMapping("/WishList")
	public String addwish(Model model)
	{
		model.addAttribute("wish", new Wish());
		return "User/WishList";
	}

	@GetMapping("/UserInformation")
	public String changeinfo(Model model)
	{
		Userinfo userinfo = infodao.findByname(getPrincipal());
		model.addAttribute("userinfo", userinfo);
		return "User/UserInformation";
	}
	
	@Resource(name = "infodao")
	private InfoDao infodao;
	
    private String getPrincipal()
    {  
        String userName = null;  
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
   
        if(principal instanceof UserDetails)
        {  
            userName = ((UserDetails)principal).getUsername();  
        }
        
        else
        {  
            userName = principal.toString();  
        }  
        return userName;  
    }
    
    @RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Model model)
    {
    	Userinfo userinfo = infodao.findByname(getPrincipal());
    	Set<Game> games = userinfo.getGame();
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    	String[] gameId = request.getParameterValues("gameid");

    	if(gameId == null)
    	{
    		return "User/UserInterface";
    	}
    	
    	for(String gid : gameId)
    	{
    		long id = Long.parseLong(gid);
    		Game game = infodao.findById(id);
    		games.add(game);
    	}
    	
    	userinfo.setGame(games);
    	infodao.saveUser(userinfo);
    	model.addAttribute("game", games);
    	return "User/BuyComplete";
    }

	@RequestMapping(value = "addwish", method = RequestMethod.POST)
	public String add(Model model, @Valid Wish wish, BindingResult result)
	{
		if(result.hasErrors())
		{
			return "User/WishList";
		}

		model.addAttribute("wish", wish);
		infodao.saveWish(wish);
		Userinfo userinfo = infodao.findByname(getPrincipal());
		Set<Wish> wishs = userinfo.getWish();
		wishs.add(wish);
		userinfo.setWish(wishs);
		infodao.saveUser(userinfo);
		return "User/WishComplete";
	}

	@RequestMapping(value = "deletewish", method = RequestMethod.POST)
	public String delete(Model model, @Valid Wish wish, BindingResult result)
	{
		if(result.hasErrors())
		{
			return "User/UserInterface";
		}

		model.addAttribute("wish", wish);
		infodao.saveWish(wish);
		Userinfo userinfo = infodao.findByname(getPrincipal());
		Set<Wish> wishs = userinfo.getWish();
		wishs.add(wish);
		userinfo.setWish(wishs);
		infodao.deleteWish(wish);
		return "User/UserInterface";
	}
}