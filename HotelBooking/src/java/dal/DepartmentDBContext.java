package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.OrderWait;

/**
 *
 * @author Tom
 */
public class DepartmentDBContext extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<String> getRoomType() {
        ArrayList<String> types = new ArrayList<>();
        try {
            String sql = "SELECT [roomType]\n"
                    + "  FROM [RoomTypeAndUrl]"
                    + "order by roomType desc";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                types.add(rs.getString("roomType"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return types;
    }

    public ArrayList<Department> getRoomModel() {
        ArrayList<Department> depts = new ArrayList<>();
        try {
            String sql = "select deptID, deptName, [Status], price, Department.roomType,\n"
                    + "		url_image, url_1, url_2, url_3\n"
                    + "from Department\n"
                    + "inner join RoomTypeAndUrl\n"
                    + "on Department.roomType = RoomTypeAndUrl.roomType\n"
                    + "where deptID >=101 and deptID <=112";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                Department d = new Department();
                d.setDeptID(rs.getInt("deptID"));
                d.setDeptName(rs.getString("deptName"));
                d.setStatus(rs.getBoolean("Status"));
                d.setPrice(rs.getInt("price"));
                d.setTypeDept(rs.getString("roomType"));
                String url_img = rs.getString("url_image");
                d.getUrl().add(url_img);
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }

    public ArrayList<Department> getRoomByName(String name) {
        ArrayList<Department> deptList = new ArrayList<>();
        try {
            String sql = "select deptID, deptName, [Status], price, Department.roomType,\n"
                    + "		url_image, url_1, url_2, url_3\n"
                    + "from Department\n"
                    + "inner join RoomTypeAndUrl\n"
                    + "on Department.roomType = RoomTypeAndUrl.roomType\n"
                    + "where deptName = ? \n";
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            rs = stm.executeQuery();

            while (rs.next()) {
                Department d = new Department();
                d.setDeptID(rs.getInt("deptID"));
                d.setDeptName(rs.getString("deptName"));
                d.setStatus(rs.getBoolean("Status"));
                d.setPrice(rs.getInt("price"));
                d.setTypeDept(rs.getString("roomType"));
                String url_img = rs.getString("url_image");
                d.getUrl().add(url_img);
                String url_1 = rs.getString("url_1");
                d.getUrl().add(url_1);
                String url_2 = rs.getString("url_2");
                d.getUrl().add(url_2);
                String url_3 = rs.getString("url_3");
                d.getUrl().add(url_3);

                deptList.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deptList;
    }

    public ArrayList<Department> getRoomByKey(String status) {
        ArrayList<Department> depts = new ArrayList<>();
        try {
            String sql = "select Department.deptID, Department.deptName, Department.[Status], CheckIn, CheckOut\n"
                    + "from Department \n"
                    + "left join Booking_Detail on Booking_Detail.deptID = Department.deptID\n"
                    + "left join OrderWait on Booking_Detail.orderWaitID = OrderWait.CustomerID\n"
                    + "where Department.[Status] = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            rs = stm.executeQuery();

            while (rs.next()) {
                Department d = new Department();
                d.setDeptID(rs.getInt("deptID"));
                d.setDeptName(rs.getString("deptName"));
                d.setStatus(rs.getBoolean("Status"));
                if (status.equals("0")) {
                    d.setTime(rs.getDate("CheckIn"));
                } else if (status.equals("1")) {
                    d.setTime(rs.getDate("CheckOut"));
                }
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }

    public ArrayList<Department> searchRoom(String type) {
        ArrayList<Department> depts = new ArrayList<>();
        try {
            String sql = "select top(3) deptID, deptName, [Status], price, Department.roomType,\n"
                    + "		url_image, url_1, url_2, url_3\n"
                    + "from Department\n"
                    + "inner join RoomTypeAndUrl\n"
                    + "on Department.roomType = RoomTypeAndUrl.roomType\n"
                    + "where Department.roomType = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, type);
            rs = stm.executeQuery();

            while (rs.next()) {
                Department d = new Department();
                d.setDeptID(rs.getInt("deptID"));
                d.setDeptName(rs.getString("deptName"));
                d.setStatus(rs.getBoolean("Status"));
                d.setPrice(rs.getInt("price"));
                d.setTypeDept(rs.getString("roomType"));
                String url_img = rs.getString("url_image");
                d.getUrl().add(url_img);
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }

    public ArrayList<Department> getRoomForOrder(String deptName) {
        ArrayList<Department> departments = new ArrayList<>();
        try {
            String sql = "select deptID  \n"
                    + "from Department\n"
                    + "where Department.deptName = ? and [Status] = 0\n";
            stm = connection.prepareStatement(sql);
            stm.setString(1, deptName);
            rs = stm.executeQuery();
            while (rs.next()) {
                Department d = new Department();
                d.setDeptID(rs.getInt(1));
                departments.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return departments;
    }

    public void checkOut(String depID) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Department]\n"
                    + "   SET [Status] = 0\n"
                    + " WHERE deptID = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, depID);
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

//    public static void main(String[] args) {
//        DepartmentDBContext ddb = new DepartmentDBContext();
//
//        for (Department department : ddb.getRoomByName("SILVER DOUBLE ROOM")) {
//            System.out.println(department.getDeptID());
//        }
//    }
}
