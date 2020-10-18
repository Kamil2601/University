# !/usr/bin/python
# cg-merger-cs.py by aCat
# Allows merging C# projects containing multiple files into one file suitable for CGSync addon

_version = 0.832

# 
# Info:
#   - requires the main class to be named 'Player'
#   - script is not working with namespaces - do not use them
#   - probably not working with not flat source files structure

# Integration with Visual Studio:
#   0. Put cg-merger-cs.py into the folder containing .csproj and .cs source files
#   1. Save all source files with File -> Advanced Save Options -> Unicode (UTF-8 without signature)
#   2. Change Visual Studio settings:
#     Project (.csproj) -> Properties -> Post-build event command line:
#       cd $(SolutionDir)
#       python3 cg-merger-cs.py
# 

import os
import glob

print('Running cg-merger-cs version '+str(_version)+' by aCat')
projname = os.path.splitext(glob.glob("*.csproj")[0])[0]
outputfname = projname + "_OUT.txt"
print('  Project name: "'+projname+'".')
sourcefnames = [fname for fname in glob.glob('*.cs') if fname != outputfname]
print('  Preparing to merge '+str(len(sourcefnames))+' source files.')

usings = set()
output = []

for sourcefname in sourcefnames:
  output.append('\n\n{0}\n{0}\n{1} {2}\n{0}\n{0}\n'.format(80*'/', 10*'/'+20*' ', sourcefname))
  with open(sourcefname, 'r') as sourcef:
    print('   Merging ' + sourcefname+': ', end='')
    lines=0
    for line in sourcef.readlines():
      lines += 1
      if line.startswith('using '):
        usings.add(line)
      else:
        output.append(line)
    print('done ('+str(lines)+' lines)')

with open(outputfname, 'w') as outputf:
  outputf.writelines(sorted(usings,reverse=True))
  outputf.writelines(output)

print ('  All %d files successfully merged.\n    Resulting in ~%d lines with %d imports.\n    Output file: "%s".' 
       % ( len(sourcefnames), 4+len(usings)+7*(len(sourcefnames))+len(output), len(usings), outputfname))
