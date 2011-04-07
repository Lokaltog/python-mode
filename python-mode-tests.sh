#!/bin/bash
 # --

# Author: Andreas Roehler <andreas.roehler@online.de>

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# Commentary:

#  tests Emacs python-mode
#
# Code:

# Edit the vars pointing to the directories/files
# holding your python-mode for test

# assumes python-mode files in current directory

# the path 
PDIR=`pwd`

# python-mode file to load
if [ -s "python-components-mode.el" ];
    then
    PYTHONMODE="python-components-mode.el"
    else
    PYTHONMODE="python-mode.el"
fi

CCCMDS="~/emacs-23.2.94/lisp/progmodes/cc-cmds.el"
# file holding the tests
TESTFILE="py-bug-numbered-tests.el"
TESTFILE2="python-mode-test.el"
EMACS="/emacs-23.2.94/src/emacs"

$HOME/$EMACS -Q --batch --eval "(message (emacs-version))" --eval "(when (featurep 'python-mode)(unload-feature 'python-mode t))" --eval "(add-to-list 'load-path \"$PDIR/\")" -load "$PDIR/$PYTHONMODE" -load "$PDIR/$TESTFILE" -load "$PDIR/$TESTFILE2" -load $CCCMDS \
--funcall nested-dictionaries-indent-lp:328791-test \
--funcall triple-quoted-string-dq-lp:302834-test \
--funcall fore-00007F-breaks-indentation-lp:328788-test \
--funcall dq-in-tqs-string-lp:328813-test \
--funcall py-current-defun-lp:328846-test \
--funcall mark-decorators-lp:328851-test \
--funcall flexible-indentation-lp:328842-test \
--funcall hungry-delete-backwards-lp:328853-test \
--funcall hungry-delete-forward-lp:328853-test \
--funcall beg-end-of-defun-lp:303622-test \
--funcall bullet-lists-in-comments-lp:328782-test \
--funcall imenu-newline-arglist-lp:328783-test \
--funcall nested-indents-lp:328775-test \
--funcall imenu-matches-in-docstring-lp:436285-test \
--funcall exceptions-not-highlighted-lp:473525-test \
--funcall previous-statement-lp:637955-test \
--funcall inbound-indentation-multiline-assignement-lp:629916-test \
--funcall indentation-of-continuation-lines-lp:691185-test \
--funcall goto-beginning-of-tqs-lp:735328-test \
--funcall class-treated-as-keyword-lp:709478-test \
--funcall backslashed-continuation-line-indent-lp:742993-test \
--funcall py-decorators-face-lp:744335-test \
--funcall indent-after-return-lp:745208-test \
--funcall keep-assignements-column-lp:748198-test \
--funcall indent-triplequoted-to-itself-lp:752252-test \
\
--funcall py-beginning-of-block-test \
--funcall py-end-of-block-test \
--funcall py-beginning-of-block-or-clause-test \
--funcall py-end-of-block-or-clause-test \
--funcall py-beginning-of-def-test \
--funcall py-end-of-def-test \
--funcall py-beginning-of-def-or-class-test \
--funcall py-end-of-def-or-class-test \
--funcall py-electric-backspace-test \
--funcall py-electric-delete-test



