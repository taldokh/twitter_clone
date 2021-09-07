import { User } from './../../database/models/user.model';
import { fsBucket } from '../../database/grid_fs/fs';
import { Console } from 'console';

export const userDal = {

    profilePageDetails: async (id: Number) => {
        return await User.findById(id).select('name userHandle joinDate bio profileImageId headerImageId followers following');
    },

    profileImage: async (id: Number) => {
        return await fsBucket.openDownloadStreamByName('1' + String(id));
    },

    headerImage: async (id: Number) => {
        return fsBucket.openDownloadStreamByName('2' + String(id));
    }
}