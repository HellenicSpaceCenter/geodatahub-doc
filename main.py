"""Main module to enable macros"""

import os


def define_env(env):
    env.variables["env"] = os.environ
