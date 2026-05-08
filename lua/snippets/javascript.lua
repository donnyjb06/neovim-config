local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local filename_to_component_name = function()
  local filename = vim.fn.expand("%:t:r")

  return filename
      :gsub("[-_](%w)", function(char)
        return char:upper()
      end)
      :gsub("^%l", string.upper)
end

local capitalize = function(args)
  local name = args[1][1] or ""
  return name:gsub("^%l", string.upper)
end

return {
  -- console.log()
  s("cl", {
    t("console.log("),
    i(1),
    t(");"),
  }),

  -- labeled console.log()
  s("cll", {
    t('console.log("'),
    i(1, "label"),
    t(':", '),
    i(2),
    t(");"),
  }),

  -- console.error()
  s("ce", {
    t("console.error("),
    i(1),
    t(");"),
  }),

  -- console.table()
  s("ct", {
    t("console.table("),
    i(1),
    t(");"),
  }),

  -- React arrow function component export
  s("rafce", {
    t("const "),
    f(filename_to_component_name),
    t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <div>" }),
    i(1),
    t("</div>"),
    t({ "", "  );" }),
    t({ "", "};", "" }),
    t({ "", "export default " }),
    f(filename_to_component_name),
    t(";"),
  }),

  -- React component with props type
  s("rafcp", {
    t("type "),
    f(filename_to_component_name),
    t({ "Props = {", "  " }),
    i(1),
    t({ "", "};", "" }),
    t({ "", "const " }),
    f(filename_to_component_name),
    t(" = ({ "),
    i(2),
    t(" }: "),
    f(filename_to_component_name),
    t("Props) => {"),
    t({ "", "  return (" }),
    t({ "", "    <div>" }),
    i(3),
    t("</div>"),
    t({ "", "  );" }),
    t({ "", "};", "" }),
    t({ "", "export default " }),
    f(filename_to_component_name),
    t(";"),
  }),

  -- useState
  s("us", {
    t("const ["),
    i(1, "state"),
    t(", set"),
    f(capitalize, { 1 }),
    t("] = useState("),
    i(2),
    t(");"),
  }),

  -- useEffect
  s("ue", {
    t({ "useEffect(() => {", "  " }),
    i(1),
    t({ "", "}, [" }),
    i(2),
    t("]);"),
  }),

  -- useMemo
  s("um", {
    t("const "),
    i(1, "value"),
    t(" = useMemo(() => {"),
    t({ "", "  return " }),
    i(2),
    t(";"),
    t({ "", "}, [" }),
    i(3),
    t("]);"),
  }),

  -- useCallback
  s("uc", {
    t("const "),
    i(1, "handleAction"),
    t(" = useCallback(() => {"),
    t({ "", "  " }),
    i(2),
    t({ "", "}, [" }),
    i(3),
    t("]);"),
  }),

  -- handle function
  s("hf", {
    t("const handle"),
    i(1, "Action"),
    t(" = () => {"),
    t({ "", "  " }),
    i(2),
    t({ "", "};" }),
  }),

  -- async function
  s("af", {
    t("const "),
    i(1, "fetchData"),
    t(" = async () => {"),
    t({ "", "  " }),
    i(2),
    t({ "", "};" }),
  }),

  -- try/catch
  s("tc", {
    t({ "try {", "  " }),
    i(1),
    t({ "", "} catch (error) {", "  console.error(error);", "}" }),
  }),

  -- if statement
  s("if", {
    t("if ("),
    i(1, "condition"),
    t(") {"),
    t({ "", "  " }),
    i(2),
    t({ "", "}" }),
  }),

  -- if/else
  s("ife", {
    t("if ("),
    i(1, "condition"),
    t(") {"),
    t({ "", "  " }),
    i(2),
    t({ "", "} else {", "  " }),
    i(3),
    t({ "", "}" }),
  }),

  -- map JSX
  s("map", {
    t("{"),
    i(1, "items"),
    t(".map(("),
    i(2, "item"),
    t(") => ("),
    t({ "", "  <div key={" }),
    i(3, "item.id"),
    t("}>"),
    i(4),
    t("</div>"),
    t({ "", "))}" }),
  }),

  -- TypeScript interface
  s("int", {
    t("interface "),
    i(1, "Name"),
    t({ " {", "  " }),
    i(2),
    t({ "", "}" }),
  }),

  -- TypeScript type alias
  s("type", {
    t("type "),
    i(1, "Name"),
    t(" = "),
    i(2, "{}"),
    t(";"),
  }),

  -- React props type
  s("props", {
    t("type "),
    f(filename_to_component_name),
    t({ "Props = {", "  " }),
    i(1),
    t({ "", "};" }),
  }),

  -- import named
  s("imp", {
    t("import { "),
    i(1),
    t(' } from "'),
    i(2),
    t('";'),
  }),

  -- import default
  s("imd", {
    t("import "),
    i(1),
    t(' from "'),
    i(2),
    t('";'),
  }),

  -- export default
  s("ed", {
    t("export default "),
    i(1),
    t(";"),
  }),

  -- describe block
  s("desc", {
    t('describe("'),
    i(1, "name"),
    t('", () => {'),
    t({ "", "  " }),
    i(2),
    t({ "", "});" }),
  }),

  -- test block
  s("test", {
    t('test("'),
    i(1, "does something"),
    t('", () => {'),
    t({ "", "  " }),
    i(2),
    t({ "", "});" }),
  }),

  -- it block
  s("it", {
    t('it("'),
    i(1, "does something"),
    t('", () => {'),
    t({ "", "  " }),
    i(2),
    t({ "", "});" }),
  }),

  -- expect
  s("ex", {
    t("expect("),
    i(1),
    t(").toBe("),
    i(2),
    t(");"),
  }),

  -- expect equal
  s("eq", {
    t("expect("),
    i(1),
    t(").toEqual("),
    i(2),
    t(");"),
  }),

  -- async test
  s("atest", {
    t('test("'),
    i(1, "does something"),
    t('", async () => {'),
    t({ "", "  " }),
    i(2),
    t({ "", "});" }),
  }),
}
