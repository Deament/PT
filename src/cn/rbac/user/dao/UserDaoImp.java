package cn.rbac.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Blob;

import util.javaweb.Page;
import cn.base.BaseDao;
import cn.going.ui.model.UserI;
import cn.rbac.user.domain.User;
import cn.rbac.user.qvo.UserQvo;

@Repository
public class UserDaoImp extends BaseDao implements UserDao {

	@Override
	public UserI createandid(final User user) {
		final StringBuilder sql = new StringBuilder();
		sql.append("insert into sys_user(username,phone,email,state,password,createtime,isdelete) "
				+ " values (?,?,?,?,?,?,?)");
		KeyHolder idkey = new GeneratedKeyHolder();
		getJdbcTemplate().update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement ps = conn.prepareStatement(sql.toString());
				int count = 1;
				ps.setString(count++, user.getUsername());
				ps.setString(count++, user.getPhone());
				ps.setString(count++, user.getEmail());
				ps.setString(count++, user.getState());
				ps.setString(count++, user.getPassword());
				ps.setString(count++, user.getCreatetime());
				ps.setString(count++, user.getIsdelete());
				return ps;
			}
		}, idkey);
		user.setId(idkey.getKey().intValue());
		return user;
	}

	@Override
	public void create(final List<User> user) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into sys_user(username,phone,email,state,password,createtime,isdelete) "
				+ " values (?,?,?,?,?,?,?)");
		getJdbcTemplate().batchUpdate(sql.toString(),
				new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int index)
							throws SQLException {
						int count = 1;
						ps.setString(count++, user.get(index).getUsername());
						ps.setString(count++, user.get(index).getPhone());
						ps.setString(count++, user.get(index).getEmail());
						ps.setString(count++, user.get(index).getState());
						ps.setString(count++, user.get(index).getPassword());
						ps.setString(count++, user.get(index).getCreatetime());
						ps.setString(count++, user.get(index).getIsdelete());

					}

					@Override
					public int getBatchSize() {
						return user.size();
					}
				});
	}

	@Override
	public void remove(final Map<String, Object> map) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from sys_user where 1=1 ");
		for (Entry<String, Object> entry : map.entrySet()) {
			sql.append(" and " + entry.getKey() + "=? ");

		}
		getJdbcTemplate().update(sql.toString(), new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				int count = 1;
				for (Entry<String, Object> entry : map.entrySet()) {
					if (entry.getValue() instanceof Integer) {
						ps.setInt(count++, (Integer) entry.getValue());
					} else if (entry.getValue() instanceof String) {
						ps.setString(count++, (String) entry.getValue());
					} else if (entry.getValue() instanceof Float) {
						ps.setFloat(count++, (Float) entry.getValue());
					} else if (entry.getValue() instanceof Blob) {
						ps.setBlob(count++, (Blob) entry.getValue());
					} else {

					}

				}

			}
		});

	}

	@Override
	public void update(Map<String, Object> updatemap,
			Map<String, Object> wheremap) {
		// TODO Auto-generated method stub

	}

	@Override
	public UserI get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> query(Page page, UserQvo qvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int querycount(UserQvo qvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
