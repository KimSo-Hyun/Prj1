package notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import notice.vo.Notice;




public class NoticeDao {
   
   public Notice getNotice(String seq) throws Exception {
      String sql="select * from notices where seq="+seq;
      //db connect
      //드라이버로드
      Class.forName("oracle.jdbc.driver.OracleDriver");
      //접속
      String url="jdbc:oracle:thin:@localhost:1521:xe";
      String user="hr";
      String pw="123456";
      Connection con=DriverManager.getConnection(url, user, pw);
      //실행
      Statement st=con.createStatement();

      //결과
      ResultSet rs=st.executeQuery(sql);//select 실행
      rs.next();
      
      //
      Notice n=new Notice();
      //NoticeDetail에서 필요한 정보를 Notice에 담아보기
      n.setSeq(rs.getString("seq"));
      n.setTitle(rs.getString("title"));
      n.setWriter(rs.getString("writer"));
      n.setContent(rs.getString("content"));
      n.setRegdate(rs.getDate("regdate"));
      n.setHit(rs.getInt("hit"));
      rs.close();
      st.close();
      con.close();
      
      return n;
      
   }
   
   public int insert(Notice not) throws Exception {
	   //DB connect 
	   String sql = "insert into notices values("
	   			 +"(select max(to_number(seq))+1 from notices),"
	   			 +"?,'cj',?,systimestamp,0)";
	   //드라이버 로드 
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   // 접속 
	   String url = "jdbc:oracle:thin:@localhost:1521:xe";
	   String user = "hr";
	   String pw = "123456";
	   Connection con=DriverManager.getConnection(url, user, pw);

	   //실행 
	   PreparedStatement pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, not.getTitle());
	   pstmt.setString(2, not.getContent());

	   ///결과 
	   int af=pstmt.executeUpdate();
	   
	   return af;
   }
   
   public int update(Notice n) throws Exception {
      String sql="update notices set title=?, content=? where seq=?";

      //DB connect
      //드라이버 로드
      Class.forName("oracle.jdbc.driver.OracleDriver");
      // 접속
      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String user = "hr";
      String pw = "123456";

      Connection con=DriverManager.getConnection(url, user, pw);

      //실행
      PreparedStatement pstmt=con.prepareStatement(sql);
      pstmt.setString(1, n.getTitle());
      pstmt.setString(2, n.getContent());
      pstmt.setString(3, n.getSeq());

      //결과 
      int af=pstmt.executeUpdate();
      System.out.println("af : "+af);
      return af;


   }
   
   
   

}