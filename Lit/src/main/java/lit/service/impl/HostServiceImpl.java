package lit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lit.dao.face.HostDao;
import lit.service.face.HostService;

@Service
public class HostServiceImpl implements HostService{
	
	@Autowired HostDao hostDao;

}
