import { devRoutes } from "../app.mjs";

export function checkRunning(req, res, next) {
    devRoutes('Routes Ran Thru')
    next();
}
