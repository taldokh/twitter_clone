const mongoose = require('mongoose');
import { userSchema } from './../schema/user.schema';

const User = mongoose.model('User', userSchema);

export { User };