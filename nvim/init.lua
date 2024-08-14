local profile = os.getenv("PROFILE")

if profile == "docker" then
    require("docker.core")
    require("docker.lazy")
else
    require("emanuel-xavier.core")
    require("emanuel-xavier.lazy")
end

