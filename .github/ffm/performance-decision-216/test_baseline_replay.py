"""Pure argv/environment tests. No build, tool executable or host probe runs."""

import unittest
import baseline_replay as b


class ReplayTests(unittest.TestCase):
    def config(self):
        return dict(caller_args=["--with-conf-name=old", "--with-debug-level=release",
                                 "--with-source-date", "current", "--enable-ccache"],
                    conf_name="candidate-conf", jobs=10, source_date="1234567890",
                    build_user="retained", version_opt="adhoc.retained.original",
                    tool_env=dict(PATH="/tools/bin:/usr/bin", CC="/tools/gcc", CXX="/tools/g++", LD="/tools/ld"))

    def test_resolved_date_user_version_and_disable_cache(self):
        configure, build, env = b.commands(self.config(), {"CFLAGS": "unreviewed", "PATH": "/wrong"})
        self.assertNotIn("current", configure)
        self.assertNotIn("--enable-ccache", configure)
        self.assertIn("--with-source-date=1234567890", configure)
        self.assertIn("--with-build-user=retained", configure)
        self.assertIn("--with-version-opt=adhoc.retained.original", configure)
        self.assertEqual(configure[-1], "--disable-ccache")
        self.assertEqual(env["SOURCE_DATE_EPOCH"], "1234567890")
        self.assertEqual(env["CC"], "/tools/gcc")
        self.assertEqual(env["PATH"], "/tools/bin:/usr/bin")
        self.assertNotIn("CFLAGS", env)
        self.assertEqual(build, ["make", "CONF=candidate-conf", "JOBS=10", "images"])

    def test_pinned_flags_preserved(self):
        cfg = self.config()
        cfg["caller_args"] += ["--with-native-debug-symbols=internal", "--with-extra-cflags=-DKEPT"]
        configure, *_ = b.commands(cfg, {})
        self.assertIn("--with-native-debug-symbols=internal", configure)
        self.assertIn("--with-extra-cflags=-DKEPT", configure)

    def test_unbound_tools_missing_metadata_or_bad_option_stop(self):
        for key, value in [("source_date", "current"), ("version_opt", ""), ("jobs", 11),
                           ("caller_args", ["--with-source-date"])]:
            cfg = self.config()
            cfg[key] = value
            with self.assertRaises(ValueError):
                b.commands(cfg, {})
        cfg = self.config()
        del cfg["tool_env"]["CC"]
        with self.assertRaises(ValueError):
            b.commands(cfg, {})


if __name__ == "__main__":
    unittest.main()
