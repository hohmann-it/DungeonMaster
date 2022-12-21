import {RemoteApp} from '@eclipse-scout/core';
import * as ddhub from './index';

Object.assign({}, ddhub); // Use import so that it is not marked as unused

new RemoteApp().init();
