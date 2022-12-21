import {RemoteApp} from '@eclipse-scout/core';
import * as dungeonmaster from './index';

Object.assign({}, dungeonmaster); // Use import so that it is not marked as unused

new RemoteApp().init();
