public class DAO {

    private static final String LOGIN = "SELECT userId, fullName, role FROM tbl_User WHERE userId LIKE ? AND password LIKE ?";
    private static final String SEARCHBYIDORNAME = "SELECT [mobileId], [description] ,[price],[mobileName], [quantity], [notSale], [yearOfProduction] FROM [dbo].[tbl_Mobile] WHERE [mobileId] LIKE ? OR [mobileName] LIKE ?";
    private static final String SEARCHBYID = "SELECT [mobileId], [description] ,[price],[mobileName], [quantity], [notSale], [yearOfProduction] FROM [dbo].[tbl_Mobile] WHERE [mobileId] LIKE ?";
    private static final String SEARCHBYNAME = "SELECT [mobileId], [description] ,[price],[mobileName], [quantity], [notSale], [yearOfProduction] FROM [dbo].[tbl_Mobile] WHERE [mobileName] LIKE ?";
    private static final String SEARCHBYPRICE = "SELECT [mobileId], [description] ,[price],[mobileName], [quantity], [notSale], [yearOfProduction] FROM [dbo].[tbl_Mobile]  WHERE [price] >= ? AND [price] <= ?";
    private static final String UPDATE = "UPDATE [dbo].[tbl_Mobile] SET [description] = ?, [quantity] = ?, [price] = ? , [notSale] = ? WHERE [mobileId] LIKE ?";
    private static final String DELETE = "DELETE [dbo].[tbl_Mobile] WHERE [mobileId] = ?";
    private static final String CREATE = "INSERT INTO [tbl_Mobile] ([mobileId], [description] ,[price],[mobileName], [quantity], [notSale], [yearOfProduction]) VALUES (?, ?, ?, ?, ?, ?, ?)";

    public User checkLogin(String userID, int password) throws SQLException {
        User user = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(LOGIN);
                ps.setString(1, userID);
                ps.setInt(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    int role = rs.getInt("role");
                    user = new User(userID, -1, fullName, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public List<Mobile> getMobileListByIdOrName(String mobileId, String mobileName) throws SQLException, ClassNotFoundException {
        List<Mobile> airList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                if ((mobileId != "" && mobileName != "") || (mobileId == "" && mobileName == "")) {
                    ps = con.prepareStatement(SEARCHBYIDORNAME);
                    ps.setString(1, '%' + mobileId + '%');
                    ps.setString(2, '%' + mobileName + '%');

                } else if (mobileId != "") {
                    ps = con.prepareStatement(SEARCHBYID);
                    ps.setString(1, '%' + mobileId + '%');

                } else if (mobileName != "") {
                    ps = con.prepareStatement(SEARCHBYNAME);
                    ps.setString(1, '%' + mobileName + '%');
                }
                rs = ps.executeQuery();
                while (rs.next()) {
                    String MobileId = rs.getString("mobileId");
                    String Description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String MobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    airList.add(new Mobile(MobileId, Description, price, MobileName, yearOfProduction, quantity, notSale));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return airList;
    }

    public List<Mobile> getMobileListByPrice(float min, float max) throws SQLException, ClassNotFoundException {
        List<Mobile> airList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                if (min < 0) {
                    min = 0;

                } else if (max < min) {
                    max = min;
                } else if (max <= 0) {
                    max = 100000000;

                }
                ps = con.prepareStatement(SEARCHBYPRICE);

                ps.setFloat(1, min);
                ps.setFloat(2, max);

                rs = ps.executeQuery();
                while (rs.next()) {
                    String MobileId = rs.getString("mobileId");
                    String Description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String MobileName = rs.getString("mobileName");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    airList.add(new Mobile(MobileId, Description, price, MobileName, yearOfProduction, quantity, notSale));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return airList;
    }

    public boolean delete(String mobileId) throws ClassNotFoundException, SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETE);
                ps.setString(1, mobileId);
                checkDelete = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkDelete;
    }

    public boolean CreateMobile(Mobile mobile) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(CREATE);
                ps.setString(1, mobile.getMobileId());
                ps.setString(2, mobile.getDescription());
                ps.setFloat(3, mobile.getPrice());
                ps.setString(4, mobile.getMobileName());
                ps.setInt(5, mobile.getQuantity());
                ps.setBoolean(6, mobile.isNotSale());
                ps.setInt(7, mobile.getYearOfProduction());
                result = ps.executeUpdate() > 0 ? true : false;

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
            return result;

        }
    }
     public boolean UpdateMobile(Mobile mobile) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATE);
                ps.setString(1, mobile.getDescription());
                ps.setInt(2, mobile.getQuantity());
                ps.setFloat(3, mobile.getPrice());
                ps.setBoolean(4, mobile.isNotSale());
                ps.setString(5, mobile.getMobileId());
                result = ps.executeUpdate() > 0 ? true : false;

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
            return result;

        }
    }
}
