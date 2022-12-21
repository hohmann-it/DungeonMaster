package com.hohmannit.dungeonmaster.shared.helloworld;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;

/**
 * @author phohm
 */
@TunnelToServer
public interface IHelloWorldService extends IService {
	HelloWorldFormData load(HelloWorldFormData input);
}
