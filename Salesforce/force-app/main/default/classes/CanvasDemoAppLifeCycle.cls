public with sharing class CanvasDemoAppLifeCycle implements Canvas.CanvasLifecycleHandler {
	public set<Canvas.ContextTypeEnum> excludeContextTypes() {
		Set<Canvas.ContextTypeEnum> excluded = new Set<Canvas.ContextTypeEnum>();

		return excluded;
	}

	public void onRender(Canvas.RenderContext renderContext) {
		Canvas.ApplicationContext app = renderContext.getApplicationContext();
		Canvas.EnvironmentContext env = renderContext.getEnvironmentContext();

		if (false) {
			throw new Canvas.CanvasRenderException('This is sample error message');
		}

		// Add Entity Fields
		env.addEntityField('*');
		//env.addEntityFields(new Set<String>{'Name', 'Description'});

		// Get current parameters
		Map<String, Object> previousParams = (Map<String, Object>) JSON.deserializeUntyped(env.getParametersAsJSON());

		// Add new parameters
		previousParams.put('TestParamName01','TestParamValue01');
		previousParams.put('TestParamName02','TestParamValue02');
		previousParams.put('TestParamName03','TestParamValue03');

		// Now replace the parameters with the current parameters plus our new custom params
		env.setParametersAsJSON(JSON.serialize(previousParams));
	}
}