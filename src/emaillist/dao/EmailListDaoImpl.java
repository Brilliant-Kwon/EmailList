package emaillist.dao;

import emaillist.vo.EmailVo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmailListDaoImpl extends BaseDao implements EmailListDao {

    public EmailListDaoImpl(String dbUser, String dbPass) {
        super(dbUser, dbPass);
    }

    @Override
    public List<EmailVo> getList() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        List<EmailVo> list = new ArrayList<>();
        try {
            conn = getConnection();
            String sql = "SELECT no, last_name, first_name, email, created_at FROM emaillist ORDER BY created_at DESC";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Long no = rs.getLong(1);
                String lastName = rs.getString(2);
                String firstName = rs.getString(3);
                String email = rs.getString(4);
                Date createdAt = rs.getDate(5);

                EmailVo info = new EmailVo(no, lastName, firstName, email, createdAt);
                list.add(info);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error!");
            System.err.println("ERROR : " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("SQL Error!");
                System.err.println("ERROR : " + e.getMessage());
            }
        }

        return list;
    }

    @Override
    public boolean insert(EmailVo vo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int insertedCount = 0; // 삽입된 row 수

        try {
            conn = getConnection();
            String sql = "INSERT INTO emaillist VALUES(seq_emaillist_pk.nextval,?,?,?,sysdate)";
            pstmt = conn.prepareStatement(sql);
//            pstmt.setLong(1, vo.getNo());
            pstmt.setString(1, vo.getLastName());
            pstmt.setString(2, vo.getFirstName());
            pstmt.setString(3, vo.getEmail());
//            pstmt.setDate(5,vo.getCreatedAt());

            insertedCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("SQL Error!");
            System.err.println("ERROR : " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("SQL Error!");
                System.err.println("ERROR : " + e.getMessage());
            }
        }

        return insertedCount == 1;
    }

    @Override
    public boolean delete(Long no) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int insertedCount = 0; // 삽입된 row 수

        try {
            conn = getConnection();
            String sql = "DELETE FROM emaillist WHERE no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, no);

            insertedCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("SQL Error!");
            System.err.println("ERROR : " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("SQL Error!");
                System.err.println("ERROR : " + e.getMessage());
            }
        }

        return insertedCount == 1;
    }

    @Override
    public boolean search(String name) {
        return false;
    }
}
