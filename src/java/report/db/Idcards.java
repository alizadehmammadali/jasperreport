package report.db;

import report.beans.Person;
import java.sql.*;
import java.util.ArrayList;

public class Idcards {

    public ArrayList<Person> retrievelist() {
        ArrayList<Person> people = new ArrayList<Person>();
        try {
            Connection conn = new Connector().connect();
            PreparedStatement psmt = conn.prepareStatement("select * from personinfo");
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                Person p = new Person();
                p.setName(rs.getString("Name"));
                p.setSurname(rs.getString("Surname"));
                p.setAge(rs.getInt("Age"));
                p.setJob(rs.getString("Job"));
                people.add(p);
            }
        } catch (Exception e) {
            System.out.println("Exception in Idcards:" + e.getMessage());
        }
        return people;
    }
   
}
