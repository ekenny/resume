package resume

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Person implements Serializable, Comparable<Person>{

  static searchable = {
      root false
  }

    String title
    String suffix
    String firstName
    String middleName
    String lastName
    String email
    String phoneNumber
    String address
    String city
    String state
    String zip

    String username

    List experiences

    /*List certs*/

    List awards

    List licenses

    List memberships
   

    static hasMany = [experiences:Experience,
        projects: Project,
        education:Education,
        skills:Skill,
        resumes:Resume,
        certs:Certification,
        awards:Award,
        licenses:License,
        memberships:Membership,
        patents:Patent,
        interests:String
    ]

    static transients = ["fullName"]

    static constraints = {
        middleName(nullable: true)
        title(nullable: true)
        suffix(nullable: true)
        certs(nullable: true)
        awards(nullable: true)
        licenses(nullable: true)
        memberships(nullable:true)
        interests(nullable:true)
    }

    public void setSelectedSkillsById(List ids){
        this.skills = ids.collect{
           Skill s = Skill.get( it )
           return s
        }
    }

    /**
     * A convience property for returning the
     * full name of the individual.
     */
    public String getFullName(){
        if(firstName && lastName){
            return "${firstName} ${lastName}"
        }
        return ""
    }

	int compareTo(Person person){
	   return new CompareToBuilder()
	       .append(this.username, person.username)
	       .toComparison();		
	}
	
	int hashCode(){
	   return new HashCodeBuilder(17, 37).
	       append(username).
	       toHashCode();		
	}
	
	boolean equals(Object o){
		
		if( !(o instanceof Person) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		Person person = (Person)o;
		return new EqualsBuilder()
		                 .append(this.username, person.username)
		                 .isEquals();
	}


    public String toString(){
        return "${getFullName()}"
    }
}
