package edu.neu.Controllers;

import java.util.Set;

import javax.annotation.Resource;
import javax.validation.Valid;

import edu.neu.Daos.InfoDao;
import edu.neu.Modules.Game;
import edu.neu.Modules.Userinfo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/Manager/*")
public class ManagerController
{
	@GetMapping("/ManagerInterface")
	public String home(Model model)
	{
		Userinfo userinfo = infodao.findByname(getPrincipal());
		model.addAttribute("userinfo", userinfo);
		return "Manager/ManagerInterface";
	}
	
	@GetMapping("/AddGame")
	public String addgame(Model model)
	{
		model.addAttribute("game", new Game());
		return "Manager/AddGame";
	}

	@GetMapping("/ManagerInformation")
	public String changeinfo(Model model)
	{
		Userinfo userinfo = infodao.findByname(getPrincipal());
		model.addAttribute("userinfo", userinfo);
		return "Manager/ManagerInformation";
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
	public String add(Model model, @Valid Game game, BindingResult result)
	{
		if(result.hasErrors())
		{
			return "Manager/AddGame";
		}
		
		model.addAttribute("game", game);
		infodao.saveGame(game);
		Userinfo userinfo = infodao.findByname(getPrincipal());
		Set<Game> games = userinfo.getGame();
		games.add(game);
		userinfo.setGame(games);
		infodao.saveUser(userinfo);
		return "Manager/AddComplete";
	}
}