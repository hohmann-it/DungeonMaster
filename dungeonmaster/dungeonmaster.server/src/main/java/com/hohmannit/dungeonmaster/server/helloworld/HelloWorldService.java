package com.hohmannit.dungeonmaster.server.helloworld;

import com.hohmannit.dungeonmaster.server.ServerSession;
import com.hohmannit.dungeonmaster.shared.helloworld.HelloWorldFormData;
import com.hohmannit.dungeonmaster.shared.helloworld.IHelloWorldService;

/**
 * @author phohm
 */
public class HelloWorldService implements IHelloWorldService {

	@Override
	public HelloWorldFormData load(HelloWorldFormData input) {
		StringBuilder msg = new StringBuilder();
		msg.append("Hello ").append(ServerSession.get().getUserId()).append('!');
		input.getMessage().setValue(msg.toString());
		return input;
	}
}
