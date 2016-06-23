package cn.rbac.user.dao;

import java.util.List;
import java.util.Map;

import util.javaweb.Page;
import cn.going.ui.model.UserI;
import cn.rbac.user.domain.User;
import cn.rbac.user.qvo.UserQvo;

public interface UserDao {
	// 返回主键的创建
	public UserI createandid(User user);

	public void create(List<User> user);

	// 根据某些属性来删除 不再限定个数 禁止传HashMap
	public void remove(Map<String, Object> map);

	// 根据某些属性来更新 不再限定固定属性
	public void update(Map<String, Object> updatemap,
			Map<String, Object> wheremap);

	public UserI get(int id);

	public List<User> query(Page page, UserQvo qvo);

	public int querycount(UserQvo qvo);

}
