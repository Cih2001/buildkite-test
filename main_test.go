package main

import "testing"

func TestDummy(t *testing.T) {
	t.Log("dummy test passed successfully.")
}

func TestFailDummy(t *testing.T) {
	t.Log("dummy test failed.")
	t.Fail()
}
