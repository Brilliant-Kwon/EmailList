package emaillist.dao;

import emaillist.vo.EmailVo;

import java.util.List;

public interface EmailListDao {
    //메서드 선언
    public List<EmailVo> getList();

    public boolean insert(EmailVo vo);

    public boolean delete(Long no);

    public boolean search(String name);
    
}
