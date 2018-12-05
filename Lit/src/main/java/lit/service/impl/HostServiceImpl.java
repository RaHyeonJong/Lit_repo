package lit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.HostDao;

@Service
public class HostServiceImpl {
	
	@Autowired HostDao hostDao;

}
