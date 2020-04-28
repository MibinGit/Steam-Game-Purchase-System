package edu.neu.Modules;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.validation.constraints.NotNull;

@Entity(name = "game")
@NamedQueries({
	@NamedQuery(name = "Game.findById",
			query = "select distinct c from game c where c.id = :id"),
	@NamedQuery(name = "Game.findAll",
			query = "select distinct c from game c left join fetch c.userinfo u")
})
public class Game implements Serializable
{
	private long id;
	private String gamename;
	private String price;
	private String issuer;
	private String issuedate;
	private String type;
	private String description;
	private Set<Userinfo> userinfo = new HashSet<Userinfo>();

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID")
	public long getId()
	{
		return id;
	}
	
	public void setId(long id)
	{
		this.id = id;
	}
	
	@NotNull
	@Column(name = "gamename")
	public String getGamename()
	{
		return gamename;
	}
	
	public void setGamename(String gamename)
	{
		this.gamename = gamename;
	}

	@Column(name = "price")
	public String getPrice()
	{
		return price;
	}

	public void setPrice(String price)
	{
		this.price = price;
	}

	@Column(name = "issuer")
	public String getIssuer()
	{
		return issuer;
	}

	public void setIssuer(String issuer)
	{
		this.issuer = issuer;
	}

	@Column(name = "issuedate")
	public String getIssuedate()
	{
		return issuedate;
	}

	public void setIssuedate(String issuedate)
	{
		this.issuedate = issuedate;
	}

	@Column(name = "type")
	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}
	
	@Column(name = "description")
	public String getDescription()
	{
		return description;
	}
	
	public void setDescription(String description)
	{
		this.description = description;
	}

	@ManyToMany
	@JoinTable(name = "user_game_detail",
	           joinColumns = @JoinColumn(name = "GAME_ID"),
			   inverseJoinColumns = @JoinColumn(name = "USER_ID"))
	public Set<Userinfo> getUserinfo()
	{
		return userinfo;
	}
	
	public void setUserinfo(Set<Userinfo> userinfo)
	{
		this.userinfo = userinfo;
	}
	
	@Override
	public String toString()
	{
		return "Game [id = " + id + ", gamename = " + gamename + ", price = " + price + ", issuer = " + issuer + ", issuedate = " + issuedate + ", type = " + type + ", description = " + description + "]";
	}
}