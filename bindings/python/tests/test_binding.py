from unittest import TestCase

from tree_sitter import Language, Parser, Query
import tree_sitter_mojo


class TestLanguage(TestCase):
    def test_can_load_grammar(self):
        try:
            Parser(Language(tree_sitter_mojo.language()))
        except Exception:
            self.fail("Error loading Mojo grammar")

    def test_can_load_queries(self):
        language = Language(tree_sitter_mojo.language())
        Query(language, tree_sitter_mojo.HIGHLIGHTS_QUERY)
        Query(language, tree_sitter_mojo.TAGS_QUERY)
