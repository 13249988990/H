package com.foxlink.mes.bean;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="table_role")
public class Role implements Serializable
{
  private static final long serialVersionUID = -6614052029623997372L;
  private Integer id;
  private String name;
  private String description;
  private Boolean isSystem = false;
  private List<String> authorities = new ArrayList<String>();
  private Set<Admin> admins = new HashSet<Admin>();

  public Role() {
  }

  public Role(Integer id) {
	  this.id = id;
  }

@Id @GeneratedValue
  @Column(name="col_id")
  public Integer getId() {
	return id;
  }

	public void setId(Integer id) {
		this.id = id;
	}

 @Column(nullable=false,name="col_name",length=20)
  public String getName()
  {
    return this.name;
  }

  public void setName(String name)
  {
    this.name = name;
  }

  @Column(name="col_is_system",nullable=false)
	public Boolean getIsSystem() {
		return isSystem;
	}

	public void setIsSystem(Boolean isSystem) {
		this.isSystem = isSystem;
	}

  @Column(name="col_description",length=200)
  public String getDescription()
  {
    return this.description;
  }

  public void setDescription(String description)
  {
    this.description = description;
  }

  @ElementCollection(fetch=FetchType.EAGER)
  @CollectionTable(name="table_role_authority",joinColumns={@JoinColumn(name="col_role_id")})
  @Column(name="col_authoritie")
  public List<String> getAuthorities()
  {
    return this.authorities;
  }

  public void setAuthorities(List<String> authorities)
  {
    this.authorities = authorities;
  }

  @ManyToMany(mappedBy="roles", fetch=FetchType.LAZY,cascade=CascadeType.REFRESH)
  public Set<Admin> getAdmins()
  {
    return this.admins;
  }

  public void setAdmins(Set<Admin> admins)
  {
    this.admins = admins;
  }

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((id == null) ? 0 : id.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Role other = (Role) obj;
	if (id == null) {
		if (other.id != null)
			return false;
	} else if (!id.equals(other.id))
		return false;
	return true;
}

public Role(String name, String description, Boolean isSystem) {
	//super();
	this.name = name;
	this.description = description;
	this.isSystem = isSystem;
}
  
  
}
