package api

import (
	"fmt"

	"github.com/pschlump/MiscLib"
)

//
//import (
//	"fmt"
//	"os"
//
//	"github.com/pschlump/MiscLib"
//	"github.com/pschlump/godebug"
//)
//
//type ColorAttribute int
//
//const (
//	FgYellow ColorAttribute = 1
//	FgRed    ColorAttribute = 2
//)
//
//func Color(fg ColorAttribute, s string) fmt.Formatter {
//	switch fg {
//	case FgYellow:
//		return fmt.Sprintf("%s%s%s", MiscLib.ColorYellow, s, MiscLib.ColorReset)
//	case FgRed:
//		return fmt.Sprintf("%s%s%s", MiscLib.ColorRed, s, MiscLib.ColorReset)
//	}
//	fmt.Fprintf(os.Stderr, "Invalid case in Color: AT%s\n", godebug.LF(-5))
//	return s
//	// panic("unreachable code - impossible situation")
//}

//PJS -- missing library
//
//import "fmt"
//
//import "github.com/pschlump/color"
//
//var YellowFn = color.New(color.FgYellow).FormatFunc()
//var RedFn = color.New(color.FgRed).FormatFunc()
//
//func Color(fg color.Attribute, s string) fmt.Formatter {
//	switch fg {
//	case color.FgYellow:
//		return YellowFn(s)
//	case color.FgRed:
//		return RedFn(s)
//	}
//	panic("impossible situation")
//}

// See: https://blog.gopheracademy.com/advent-2018/fmt/

func YellowFn(s string) string {
	return fmt.Sprintf("%s%s%s", MiscLib.ColorYellow, s, MiscLib.ColorReset)
}
func RedFn(s string) string {
	return fmt.Sprintf("%s%s%s", MiscLib.ColorRed, s, MiscLib.ColorReset)
}
