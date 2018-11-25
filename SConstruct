
import sys
sys.path.insert(0, '/home/blinkchen/tools/blade/blade.zip')


import os
import subprocess
import signal
import time
import socket
import glob
import blade_util
from ccache_manager import ScacheManager
import scons_helper
from scons_helper import echospawn
from scons_helper import error_colorize
from scons_helper import generate_resource_file
from scons_helper import generate_resource_header
from scons_helper import MakeAction

if not os.path.exists('build64_debug'):
    os.mkdir('build64_debug')

version_cpp = open('build64_debug/version.cpp', 'w')
print >>version_cpp, 'extern "C" {'
print >>version_cpp, 'namespace binary_version {'
print >>version_cpp, 'extern const char kBuildType[] = "debug";'
print >>version_cpp, 'extern const char kBuildTime[] = "%s";' % time.asctime()
print >>version_cpp, 'extern const char kBuilderName[] = "%s";' % os.getenv('USER')
print >>version_cpp, (
    'extern const char kHostName[] = "%s";' % socket.gethostname())
print >>version_cpp, 'extern const char kCompiler[] = "GCC 4.8.5";'
print >>version_cpp, '}'
print >>version_cpp, '}'
version_cpp.close()
env_version = Environment(ENV = os.environ)
env_version.Append(SHCXXCOMSTR = 'Version information updated')
env_version.Append(CPPFLAGS = '-m64')
version_obj = env_version.SharedObject('build64_debug/version.cpp')

VariantDir('build64_debug', '.', duplicate=0)
os.environ['LC_ALL'] = 'C'
top_env = Environment(ENV=os.environ)
top_env.Decider('MD5-timestamp')
colors = scons_helper.colors
blade_util.color_enabled=True
top_env['SPAWN'] = echospawn

compile_proto_cc_message = '%sCompiling %s$SOURCE%s to cc source%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_proto_java_message = '%sCompiling %s$SOURCE%s to java source%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_proto_php_message = '%sCompiling %s$SOURCE%s to php source%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_resource_header_message = '%sGenerating resource header %s$TARGET%s%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_resource_message = '%sCompiling %s$SOURCE%s as resource file%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_source_message = '%sCompiling %s$SOURCE%s%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

link_program_message = '%sLinking Program %s$TARGET%s%s' %     (colors['green'], colors['purple'], colors['green'], colors['end'])

link_library_message = '%sCreating Static Library %s$TARGET%s%s' %     (colors['green'], colors['purple'], colors['green'], colors['end'])

ranlib_library_message = '%sRanlib Library %s$TARGET%s%s' %     (colors['green'], colors['purple'], colors['green'], colors['end']) 
link_shared_library_message = '%sLinking Shared Library %s$TARGET%s%s' %     (colors['green'], colors['purple'], colors['green'], colors['end'])

compile_java_jar_message = '%sGenerating java jar %s$TARGET%s%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_yacc_message = '%sYacc %s$SOURCE%s to $TARGET%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_swig_python_message = '%sCompiling %s$SOURCE%s to python source%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_swig_java_message = '%sCompiling %s$SOURCE%s to java source%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])

compile_swig_php_message = '%sCompiling %s$SOURCE%s to php source%s' %     (colors['cyan'], colors['purple'], colors['cyan'], colors['end'])


top_env.Append(
  CXXCOMSTR = compile_source_message,
  CCCOMSTR = compile_source_message,
  SHCCCOMSTR = compile_source_message,
  SHCXXCOMSTR = compile_source_message,
  ARCOMSTR = link_library_message,
  RANLIBCOMSTR = ranlib_library_message,
  SHLINKCOMSTR = link_shared_library_message,
  LINKCOMSTR = link_program_message,
  JAVACCOMSTR = compile_source_message
)
time_value = Value('Tue Nov 13 16:09:30 2018')
proto_bld = Builder(action = MakeAction('mm3rd/protobuf/bin/protoc --proto_path=. -I. -Imm3rd -I=`dirname $SOURCE` -Imm3rd/protobuf/src --cpp_out=build64_debug $SOURCE', compile_proto_cc_message))
proto_java_bld = Builder(action = MakeAction('mm3rd/protobuf/bin/protoc --proto_path=. --proto_path=mm3rd --java_out=build64_debug/`dirname $SOURCE` -Imm3rd/protobuf/src $SOURCE', compile_proto_java_message))
proto_php_bld = Builder(action = MakeAction('mm3rd/protobuf/bin/protoc --proto_path=. --plugin=protoc-gen-php=mm3rd/Protobuf-PHP/protoc-gen-php.php -I. -Imm3rd -Imm3rd/Protobuf-PHP/library -I=`dirname $SOURCE` -Imm3rd/protobuf/src --php_out=build64_debug/`dirname $SOURCE` $SOURCE', compile_proto_php_message))

blade_jar_bld = Builder(action = MakeAction('jar cf $TARGET -C `dirname $SOURCE` .',
    compile_java_jar_message))

yacc_bld = Builder(action = MakeAction('bison $YACCFLAGS -d -o $TARGET $SOURCE',
    compile_yacc_message))

resource_header_bld = Builder(action = MakeAction(generate_resource_header,
    compile_resource_header_message))

resource_file_bld = Builder(action = MakeAction(generate_resource_file,
    compile_resource_message))

top_env.Append(BUILDERS = {'Proto' : proto_bld})
top_env.Append(BUILDERS = {'ProtoJava' : proto_java_bld})
top_env.Append(BUILDERS = {'ProtoPhp' : proto_php_bld})
top_env.Append(BUILDERS = {'BladeJar' : blade_jar_bld})
top_env.Append(BUILDERS = {'Yacc' : yacc_bld})
top_env.Append(BUILDERS = {'ResourceHeader' : resource_header_bld})
top_env.Append(BUILDERS = {'ResourceFile' : resource_file_bld})
env = top_env.Clone()
env_with_error = top_env.Clone()
env_no_warning = top_env.Clone()

env.Replace(CC = "gcc", CXX = "g++",
          CPPPATH=['mm3rd', 'build64_debug', ''],
          CPPFLAGS=['-Wall', '-Wextra', '-Wno-unused-parameter', '-Wno-missing-field-initializers', '-Wendif-labels', '-Wfloat-equal', '-Wformat=2', '-Wframe-larger-than=65536', '-Wmissing-include-dirs', '-Wpointer-arith', '-Wwrite-strings', '-m64', '-mcx16', '-pipe', '-ggdb3', '-fstack-protector', '-D_FILE_OFFSET_BITS=64'],
          CFLAGS=[],
          CXXFLAGS=['-Wno-invalid-offsetof', '-Woverloaded-virtual', '-Wnon-virtual-dtor', '-Wvla'],
          LINK='g++',
          LINKFLAGS=['-m64', '-rdynamic', '-Lmm3rd/solib_64'])


env_with_error.Replace(CC = "gcc", CXX = "g++",
          CPPPATH=['mm3rd', 'build64_debug', ''],
          CPPFLAGS=['-Wall', '-Wextra', '-Wno-unused-parameter', '-Wno-missing-field-initializers', '-Wendif-labels', '-Wfloat-equal', '-Wformat=2', '-Wframe-larger-than=65536', '-Wmissing-include-dirs', '-Wpointer-arith', '-Wwrite-strings', '-m64', '-mcx16', '-pipe', '-ggdb3', '-fstack-protector', '-D_FILE_OFFSET_BITS=64'],
          CFLAGS=[],
          CXXFLAGS=['-Wno-invalid-offsetof', '-Woverloaded-virtual', '-Wnon-virtual-dtor', '-Wvla'],
          LINK='g++',
          LINKFLAGS=['-m64', '-rdynamic', '-Lmm3rd/solib_64'])


env_no_warning.Replace(CC = "gcc", CXX = "g++",
          CPPPATH=['mm3rd', 'build64_debug', ''],
          CPPFLAGS=['-m64', '-mcx16', '-pipe', '-ggdb3', '-fstack-protector', '-D_FILE_OFFSET_BITS=64'],
          CFLAGS=[],
          CXXFLAGS=[],
          LINK='g++',
          LINKFLAGS=['-m64', '-rdynamic', '-Lmm3rd/solib_64'])

CacheDir('/home/blinkchen/.bladescache')
blade_util.info('using cache directory /home/blinkchen/.bladescache')
scache_manager = ScacheManager('/home/blinkchen/.bladescache', cache_limit=1073741824)
Progress(scache_manager, interval=100)
env_v_3rd_rapidjson_mAgIc_rapidjson = env.Clone()
v_3rd_rapidjson_mAgIc_rapidjson = env_v_3rd_rapidjson_mAgIc_rapidjson.Command(['build64_debug/3rd/rapidjson/rapidjson.out'], [time_value], "")
env_v_3rd_rapidjson_mAgIc_rapidjson.Clean(v_3rd_rapidjson_mAgIc_rapidjson,[ '3rd/rapidjson/rapidjson.out' ])
