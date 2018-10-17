package com.fighttiger.fighter.common.tools.cache;

import redis.clients.jedis.Jedis;

/**
 * Created by kai on 16/5/20.
 * redis执行回调接口
 */
public interface ExecCaller<T> {

    T exec(Jedis jedis);

}
