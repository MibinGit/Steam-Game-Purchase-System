package edu.neu.Modules;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity(name = "userinfo")
@Table(name = "userinfo")
@NamedQueries({
	@NamedQuery(name = "Userinfo.findByName",
			    query = "select distinct u from userinfo u left join fetch u.game c where u.username = :username"),
})
public class Userinfo implements Serializable
{
	private long id;
	private String username;
	private String firstName;
	private String lastName;
	private String birthDate;
	private String email;
	private String address;
	private String phone;
	
	private Set<Game> game = new HashSet<Game>();
	private Set<Wish> wish = new HashSet<Wish>();
	
	public Userinfo()
	{
		
	}
	
	public Userinfo(String username, String firstName, String lastName, String birthDate, String email, String address, String phone)
	{
		super();
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDate = birthDate;
		this.email = email;
		this.address = address;
		this.phone = phone;
	}
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID")
	public Long getId()
	{
		return this.id;
	}

	public void setId(long id)
	{
		this.id = id;
	}
	
	@NotNull
	@Column(name = "username")
	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}
	
	@Column(name = "FIRST_NAME")
	public String getFirstName()
	{
		return firstName;
	}

	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}
	
	@Column(name = "LAST_NAME")
	public String getLastName()
	{
		return lastName;
	}

	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}
	
	@Column(name = "BIRTH_DATE")
	public String getBirthDate()
	{
		return birthDate;
	}

	public void setBirthDate(String birthDate)
	{
		this.birthDate = birthDate;
	}

	@Email(message = "Please provide a valid email address")
	@Pattern(regexp = ".+@.+\\..+", message = "Please provide a valid email address")
	@Column(name = "email")
	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}
	
	@Pattern(regexp = ".+,+.+", message = "Please provide a valid address")
	@Column(name = "address")
	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	@Pattern(regexp = "(^$|[0-9]{10})", message = "Please provide a valid phone number")
	@Column(name = "phone")
	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	@ManyToMany
	@JoinTable(name = "user_game_detail",
	           joinColumns = @JoinColumn(name = "USER_ID"),
	           inverseJoinColumns = @JoinColumn(name = "GAME_ID"))
	public Set<Game> getGame()
	{
		return game;
	}

	public void setGame(Set<Game> game)
	{
		this.game = game;
	}

	@ManyToMany
	@JoinTable(name = "user_wish_detail",
			joinColumns = @JoinColumn(name = "USER_ID"),
			inverseJoinColumns = @JoinColumn(name = "WISH_ID"))
	public Set<Wish> getWish()
	{
		return wish;
	}

	public void setWish(Set<Wish> wish)
	{
		this.wish = wish;
	}

	@Override
	public String toString()
	{
		return "Userinfo [id = " + id + ", username = " + username + ", firstName = " + firstName + ", lastName = " + lastName
				+ ", birthDate = " + birthDate + ", email = " + email + ", address = " + address + ", phone = " + phone + "]";
	}
}