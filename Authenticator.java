import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;
import java.util.ArrayList;

public class Authenticator {
    private Connection con;
/**
 * Create an authentecator object, use authenticateUser
 * use example Authenticator A = new Authenticator("localhost", "3306", "mysql");
 * @param SQLHost host url eg. "localhost" or "127.6.9.1"
 * @param SQLPortNum portnumber eg. "420"
 * @param SQLName name of the SQL database "myFirstSQL"
 * @throws SQLException
*/
    public Authenticator(String SQLHost, String SQLPortNum, String SQLName) throws SQLException {
        try {
            this.con = DriverManager.getConnection("jdbc:mysql://" + SQLHost + ":" + SQLPortNum + "/" + SQLName);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
/**
 * the authenticator, checks if the username exsists in the DB
 * @return the userType of the user of he/she exist, else retun -1 if the user doesn't exsist
 * @throws SQLException
 */
    public int authenticateUser(String username, String password) throws SQLException {
        String query = "select Type_ID from users WHERE username=\"" + username + "\" AND password=\"" + password
                + '"';
        try (Statement stmt = this.con.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return -1;
    }
    /**
     * return the pages id that the userType can view
     * @param userType
     * @return returns the pages id that the userType can view
     * @throws SQLException
     */
    public ArrayList<Integer> userTypePages(int userType) throws SQLException{
        String query = "select PID from userfunctionalities WHERE UserTID=\""+userType+'"';
        try (Statement stmt = this.con.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            ArrayList<Integer> pages = new ArrayList<Integer>();
            while (rs.next()) {
                pages.add(rs.getInt(1));
            }
            return pages;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
