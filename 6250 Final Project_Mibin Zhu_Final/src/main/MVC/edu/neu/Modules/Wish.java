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

@Entity(name = "wish")
@NamedQueries({
        @NamedQuery(name = "Wish.findById",
                query = "select distinct w from wish w where w.id = :id"),
        @NamedQuery(name = "Wish.findAll",
                query = "select distinct w from wish w left join fetch w.userinfo u")
})
public class Wish implements Serializable
{
    private long id;
    private String wishname;
    private String wishtype;
    private String wishdescription;
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
    @Column(name = "wishname")
    public String getWishname()
    {
        return wishname;
    }

    public void setWishname(String wishname)
    {
        this.wishname = wishname;
    }

    @Column(name = "wishtype")
    public String getWishtype()
    {
        return wishtype;
    }

    public void setWishtype(String wishtype)
    {
        this.wishtype = wishtype;
    }

    @Column(name = "wishdescription")
    public String getWishdescription()
    {
        return wishdescription;
    }

    public void setWishdescription(String wishdescription)
    {
        this.wishdescription = wishdescription;
    }

    @ManyToMany
    @JoinTable(name = "user_wish_detail",
            joinColumns = @JoinColumn(name = "WISH_ID"),
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
        return "Game [id = " + id + ", wishname = " + wishname + ", wishtype = " + wishtype + ", wishdescription = " + wishdescription + "]";
    }
}