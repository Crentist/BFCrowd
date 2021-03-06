/*
 *  Nimble, an extensive application base for Grails
 *  Copyright (C) 2010 Bradley Beddoes
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package grails.plugin.nimble

import grails.plugin.nimble.core.ProfileBase
import grails.plugin.nimble.core.UserBase
import grails.plugin.nimble.core.Role

/**
 * Determines correct version of class to load for classes commonly overloaded by host applications
 *
 * @author Bradley Beddoes
 */
class InstanceGenerator {

	static user(grailsApplication) {
		try {
			if(grailsApplication.config?.nimble?.implementation?.user)
				InstanceGenerator.classLoader.loadClass(grailsApplication.config.nimble.implementation.user).newInstance()
			else
				UserBase.newInstance()
		} catch(ClassNotFoundException e){
			UserBase.newInstance()
		}
	}

	static profile(grailsApplication) {
		try {
			if(grailsApplication.config?.nimble?.implementation?.profile)
				InstanceGenerator.classLoader.loadClass(grailsApplication.config.nimble.implementation.profile).newInstance()
			else
				ProfileBase.newInstance()
		} catch(ClassNotFoundException e){
			ProfileBase.newInstance()
		}
	}
	
	static role(grailsApplication) {
		try {
			if(grailsApplication.config?.nimble?.implementation?.role)
				InstanceGenerator.classLoader.loadClass(grailsApplication.config.nimble.implementation.role).newInstance()
			else
				Role.newInstance()
		} catch(ClassNotFoundException e){
			Role.newInstance()
		}
	}
}
